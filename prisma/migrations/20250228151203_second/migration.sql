-- CreateTable
CREATE TABLE "Owners" (
    "ownerId" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "clerkId" TEXT NOT NULL,

    CONSTRAINT "Owners_pkey" PRIMARY KEY ("ownerId")
);

-- CreateTable
CREATE TABLE "Projects" (
    "projectId" TEXT NOT NULL,
    "ownerId" TEXT NOT NULL,
    "APIKEY" TEXT NOT NULL,

    CONSTRAINT "Projects_pkey" PRIMARY KEY ("projectId")
);

-- CreateTable
CREATE TABLE "Members" (
    "memberId" TEXT NOT NULL,
    "developerUserId" TEXT NOT NULL,
    "projectId" TEXT NOT NULL,

    CONSTRAINT "Members_pkey" PRIMARY KEY ("memberId")
);

-- CreateTable
CREATE TABLE "Notifications" (
    "notificationId" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "buttonText" TEXT,
    "buttonUrl" TEXT,
    "memberId" TEXT NOT NULL,

    CONSTRAINT "Notifications_pkey" PRIMARY KEY ("notificationId")
);

-- CreateIndex
CREATE UNIQUE INDEX "Owners_email_key" ON "Owners"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Owners_clerkId_key" ON "Owners"("clerkId");

-- CreateIndex
CREATE UNIQUE INDEX "Projects_ownerId_key" ON "Projects"("ownerId");

-- CreateIndex
CREATE UNIQUE INDEX "Members_developerUserId_key" ON "Members"("developerUserId");

-- AddForeignKey
ALTER TABLE "Projects" ADD CONSTRAINT "Projects_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "Owners"("ownerId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Members" ADD CONSTRAINT "Members_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES "Projects"("projectId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Notifications" ADD CONSTRAINT "Notifications_memberId_fkey" FOREIGN KEY ("memberId") REFERENCES "Members"("memberId") ON DELETE RESTRICT ON UPDATE CASCADE;
