import { prisma } from "@/lib/prisma";
import { NextRequest } from "next/server";

interface NotificationContent {
  userIds: string[];
  content: string;
  buttonText?: string;
  buttonUrl?: string;
}

export async function POST(req: NextRequest) {
  const { userIds, content, buttonText, buttonUrl }: NotificationContent = await req.json();

  const newNotification = await prisma.notifications.create({
    data: {
      content,
      buttonText,
      buttonUrl,
      memberIds: userIds,
    },
  });

  for (const userId of userIds) {
    const user = await prisma.members.findUnique({
      where: {
        developerUserId: userId,
      },
    });

    if (!user) {
      const defaultProjectId = "some-default-project-id";

      await prisma.members.create({
        data: {
          developerUserId: userId,
          projectId: defaultProjectId,
        },
      });
    }

    await prisma.members.update({
      where: { developerUserId: userId },
      data: {
        notifications: {
          push: newNotification.notificationId,
        },
      },
    });
  }

  return new Response(JSON.stringify({ message: "Notification sent to users." }), {
    status: 200,
  });
}
