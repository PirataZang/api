-- CreateTable
CREATE TABLE "Pessoa" (
    "pes_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "pes_nome" TEXT NOT NULL,
    "pes_sexo" TEXT NOT NULL,
    "pes_estado_civil" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Endereco" (
    "end_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "pes_id" INTEGER NOT NULL,
    "end_rua" TEXT NOT NULL,
    "end_bairro" TEXT NOT NULL,
    "end_cidade" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Pessoa_pes_id_key" ON "Pessoa"("pes_id");

-- CreateIndex
CREATE UNIQUE INDEX "Endereco_end_id_key" ON "Endereco"("end_id");
