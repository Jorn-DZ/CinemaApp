/*
  Warnings:

  - A unique constraint covering the columns `[titel]` on the table `Films` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[naam]` on the table `Genres` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE `films` MODIFY `beschrijving` VARCHAR(2000) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `Films_titel_key` ON `Films`(`titel`);

-- CreateIndex
CREATE UNIQUE INDEX `Genres_naam_key` ON `Genres`(`naam`);
