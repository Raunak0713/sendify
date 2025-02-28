/*
  Warnings:

  - You are about to drop the column `memberId` on the `Notifications` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Notifications" DROP CONSTRAINT "Notifications_memberId_fkey";

-- AlterTable
ALTER TABLE "Notifications" DROP COLUMN "memberId";

-- CreateTable
CREATE TABLE "NotificationsOnMembers" (
    "memberId" TEXT NOT NULL,
    "notificationId" TEXT NOT NULL,

    CONSTRAINT "NotificationsOnMembers_pkey" PRIMARY KEY ("memberId","notificationId")
);

-- AddForeignKey
ALTER TABLE "NotificationsOnMembers" ADD CONSTRAINT "NotificationsOnMembers_memberId_fkey" FOREIGN KEY ("memberId") REFERENCES "Members"("memberId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NotificationsOnMembers" ADD CONSTRAINT "NotificationsOnMembers_notificationId_fkey" FOREIGN KEY ("notificationId") REFERENCES "Notifications"("notificationId") ON DELETE RESTRICT ON UPDATE CASCADE;
