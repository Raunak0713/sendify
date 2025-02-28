/*
  Warnings:

  - You are about to drop the `NotificationsOnMembers` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "NotificationsOnMembers" DROP CONSTRAINT "NotificationsOnMembers_memberId_fkey";

-- DropForeignKey
ALTER TABLE "NotificationsOnMembers" DROP CONSTRAINT "NotificationsOnMembers_notificationId_fkey";

-- AlterTable
ALTER TABLE "Members" ADD COLUMN     "notifications" TEXT[];

-- AlterTable
ALTER TABLE "Notifications" ADD COLUMN     "memberIds" TEXT[];

-- DropTable
DROP TABLE "NotificationsOnMembers";
