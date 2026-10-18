# RabBoot

<p align="center">
  <strong>Un bootloader x86 didattico, sviluppato da zero.</strong>
  <br />
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Architettura-x86-informational?style=flat-square" alt="Architettura x86" />
  <img src="https://img.shields.io/badge/Assembly-NASM-blue?style=flat-square" alt="Assembly NASM" />
  <img src="https://img.shields.io/badge/Firmware-BIOS-lightgrey?style=flat-square" alt="Firmware BIOS" />
  <img src="https://img.shields.io/badge/Emulatore-QEMU-orange?style=flat-square" alt="Emulatore QEMU" />
</p>

---

## Introduzione

**RabBoot** è un progetto didattico dedicato allo studio del processo di avvio di un computer, dal passaggio di controllo da parte del BIOS all'esecuzione del codice del nostro bootloader.

Il progetto combina lo sviluppo pratico in Assembly x86 con una raccolta di appunti tecnici che documentano i concetti affrontati durante il percorso.

L'obiettivo non è trattare il processo di avvio come una scatola nera, ma comprenderne i meccanismi, capire perché funzionano in un determinato modo e verificarli sperimentalmente.

### Obiettivi didattici

- **Assembly x86** — registri, istruzioni, indirizzamento e real mode.
- **Processo di avvio** — BIOS, boot sector, organizzazione della memoria e MBR.
- **I/O a basso livello** — interrupt BIOS e operazioni fondamentali di input/output.
- **Debugging** — analisi dell'esecuzione e dello stato della CPU con GDB e QEMU.
- **Sviluppo del bootloader** — realizzazione progressiva del codice necessario a caricare ed eseguire gli stadi successivi.

## Indice

### 📚 Teoria e sperimentazione

| Lezione                    | Argomento                    | Descrizione                                                                          |
|:--------------------------:| ---------------------------- | ------------------------------------------------------------------------------------ |
| [L1](knowledge_base/01.md) | Primo boot sector            | Scrittura e assemblaggio di un boot sector minimale capace di stampare un messaggio. |
| [L2](knowledge_base/02.md) | Inizializzazione e debugging | Preparazione dello stato iniziale della CPU e analisi dell'esecuzione con GDB.       |

### ⚙️ Sviluppo del bootloader

| Lezione                    | Argomento                                           | Descrizione                                                                                                                                   |
|:--------------------------:| --------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| [L3](knowledge_base/03.md) | Implementazione del bootloader                      | Prosecuzione dello sviluppo, con codice sorgente e spiegazioni dei meccanismi implementati. In questa lezione si affronta solo lo stadio 1.   |
| [L4](knowledge_base/04.md) | Testing del primo stadio                            | Lezione breve relativa all'implementazione di un brevissimo stadio 2 per verificarne il caricamento.                                          |
| [L5](knowledge_base/05.md) | Prima parte dell'implementazione del secondo stadio | Inizio del secondo stadio con la definizione delle prime procedure ed uso di fali sorgente differenti per rendere il bootloader più modulare. |

> Le prime lezioni introducono concetti ed esperimenti isolati. A partire da L3, l'attenzione si sposta sulla realizzazione del bootloader vero e proprio.

## Struttura del progetto

```text
RabBoot/
├── knowledge_base/    # Lezioni e appunti tecnici
├── L1.2/              # Primi esperimenti in Assembly
├── bootloader_st1.asm # Primo stadio del bootloader
├── bootloader_st2.asm # Secondo stadio del bootloader
├── modules/           # Moduli usati nel secondo stadio
└── README.md
```

## Requisiti

Per sperimentare con il codice sono necessari:

- **NASM** — per assemblare il codice sorgente.
- **QEMU** — per emulare la macchina e verificare il funzionamento del bootloader.
- **GDB** — per analizzare l'esecuzione e ispezionare lo stato della CPU.

È utile avere una conoscenza di base dell'Assembly e dell'architettura x86, ma i concetti necessari vengono introdotti progressivamente nelle singole lezioni.

Per i comandi di compilazione, esecuzione e debugging, consulta le lezioni corrispondenti.

## Stato del progetto

RabBoot è un progetto in evoluzione: il codice e la documentazione vengono sviluppati parallelamente, man mano che vengono approfonditi nuovi aspetti del processo di avvio.

La finalità principale è didattica: comprendere i meccanismi alla base dell'avvio di un sistema attraverso la loro implementazione pratica e la documentazione delle scelte effettuate.