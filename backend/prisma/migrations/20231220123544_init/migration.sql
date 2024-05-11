-- CreateTable
CREATE TABLE `Gebruikers` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `voornaam` VARCHAR(191) NOT NULL,
    `achternaam` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `wachtwoord` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Gebruikers_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Films` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `titel` VARCHAR(191) NOT NULL,
    `speelDuur` INTEGER NOT NULL,
    `beschrijving` VARCHAR(191) NOT NULL,
    `releaseDatum` DATETIME(3) NOT NULL,
    `thumbnail` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Films_thumbnail_key`(`thumbnail`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Genres` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `naam` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Cast` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `voornaam` VARCHAR(191) NOT NULL,
    `achternaam` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Voorstellingen` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `filmsId` INTEGER NOT NULL,
    `datum` DATETIME(3) NOT NULL,
    `tijd` INTEGER NOT NULL,
    `zalenId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tickets` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `voorstellingenId` INTEGER NOT NULL,
    `gebruikersId` INTEGER NOT NULL,
    `zitplaatsen` VARCHAR(191) NOT NULL,
    `totalePrijs` DECIMAL(65, 30) NOT NULL,
    `aankoopdatum` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Zalen` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `naam` VARCHAR(191) NOT NULL,
    `capaciteit` INTEGER NOT NULL,
    `schermType` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_FilmsToGenres` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_FilmsToGenres_AB_unique`(`A`, `B`),
    INDEX `_FilmsToGenres_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_CastToFilms` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_CastToFilms_AB_unique`(`A`, `B`),
    INDEX `_CastToFilms_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Voorstellingen` ADD CONSTRAINT `Voorstellingen_filmsId_fkey` FOREIGN KEY (`filmsId`) REFERENCES `Films`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Voorstellingen` ADD CONSTRAINT `Voorstellingen_zalenId_fkey` FOREIGN KEY (`zalenId`) REFERENCES `Zalen`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Tickets` ADD CONSTRAINT `Tickets_voorstellingenId_fkey` FOREIGN KEY (`voorstellingenId`) REFERENCES `Voorstellingen`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Tickets` ADD CONSTRAINT `Tickets_gebruikersId_fkey` FOREIGN KEY (`gebruikersId`) REFERENCES `Gebruikers`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_FilmsToGenres` ADD CONSTRAINT `_FilmsToGenres_A_fkey` FOREIGN KEY (`A`) REFERENCES `Films`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_FilmsToGenres` ADD CONSTRAINT `_FilmsToGenres_B_fkey` FOREIGN KEY (`B`) REFERENCES `Genres`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_CastToFilms` ADD CONSTRAINT `_CastToFilms_A_fkey` FOREIGN KEY (`A`) REFERENCES `Cast`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_CastToFilms` ADD CONSTRAINT `_CastToFilms_B_fkey` FOREIGN KEY (`B`) REFERENCES `Films`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
