/*
  Warnings:

  - You are about to drop the column `pes_id` on the `Endereco` table. All the data in the column will be lost.
  - Added the required column `pessoaPes_id` to the `Endereco` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Endereco" (
    "end_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "end_rua" TEXT NOT NULL,
    "end_bairro" TEXT NOT NULL,
    "end_cidade" TEXT NOT NULL,
    "pessoaPes_id" INTEGER NOT NULL,
    CONSTRAINT "Endereco_pessoaPes_id_fkey" FOREIGN KEY ("pessoaPes_id") REFERENCES "Pessoa" ("pes_id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Endereco" ("end_bairro", "end_cidade", "end_id", "end_rua") SELECT "end_bairro", "end_cidade", "end_id", "end_rua" FROM "Endereco";
DROP TABLE "Endereco";
ALTER TABLE "new_Endereco" RENAME TO "Endereco";
CREATE UNIQUE INDEX "Endereco_end_id_key" ON "Endereco"("end_id");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
