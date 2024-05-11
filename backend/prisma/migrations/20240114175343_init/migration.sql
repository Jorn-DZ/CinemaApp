/*
  Warnings:

  - A unique constraint covering the columns `[email]` on the table `Gebruikers` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX `Gebruikers_email_key` ON `Gebruikers`(`email`);
