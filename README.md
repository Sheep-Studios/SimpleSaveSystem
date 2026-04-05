# 🐑 SIMPLE SAVE SYSTEM

**Developed & Maintained by Sheep Studios**

[sheepstudios.net](https://sheepstudios.net)

---

Saving and loading has never been so easy! This system is designed to be a "plug-and-play" solution for GameMaker projects.

## 🛠️ HOW TO USE

1.  **OPEN THE SCRIPT:** Find `scr_simple_save_system`.
2.  **DEFINE YOUR DATA:** Locate the `SAVE` struct (Line 14) and add your variables. These represent your starting "default" values.
4.  **THAT'S IT!** The system handles everything else in the background.

---

## 📋 SAMPLE SETUP

### [ STEP A: Define in Script ]
<img width="795" height="134" alt="image" src="https://github.com/user-attachments/assets/4656c4d1-d651-4a56-9d0f-67b266a2c76a" />

### [ STEP B: Use Anywhere ]
**In a Collision Event:**

<img width="285" height="64" alt="image" src="https://github.com/user-attachments/assets/a7edf5d6-7702-4896-84e4-2d80b95b9665" />

**In a Shop UI:**

<img width="322" height="91" alt="image" src="https://github.com/user-attachments/assets/f9c7f011-5926-4817-b107-be4b338ee5bc" />

---

> _**"Wait, I don't have to define it in my Create event..?"**_
  - _Nope, never! That's the bliss of SimpleSaveSystem\!_

---

## 💡 PRO TIPS

* **AUTO-SAVE:** Saves every 3 seconds (by default) if changes are detected.
* **MANUAL SAVING:** Use `save_game()` to save manually at any time.
* **ENCRYPTION:** Uses Base64 to keep data safe from simple editing.

---

## 🤝 GETTING HELP

Found a bug or have a question? Create an issue!

---

**HAPPY CODING! <3**
