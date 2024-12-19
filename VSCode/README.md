# Ultimate-VSCode-Settings
Press <kbd>F1</kbd> and click `Open User Settings (JSON)`

See `settings.json` in the same folder as this README.

---
Press <kbd>F1</kbd> and click `Preferences: Open Keyboard Shortcuts (JSON)`

`keybindings.json`:
```
// Place your key bindings in this file to override the defaults
[
    {
        "key": "shift+enter",
        "command": "-python.execSelectionInTerminal",
        "when": "editorTextFocus && !findInputFocussed && !jupyter.ownsSelection && !notebookEditorFocused && !replaceInputFocussed && editorLangId == 'python'"
    }
]
```

---

## Extensions:
- Highlight Bad Chars
- Remote - SSH
- Remote - SSH: Editing Configuration Files
- Python
- Pylance
- Jupyter
- GitLens
- Better Comments
- Selected Lines Count

---

## Use Remote SSH with a private key instead of a password:

### Windows 10:
To use Remote SSH with a private key all you have to do is make sure that there is a private key in the same directory as the SSH config that VSCode checks

You can check which SSH config VSCode is using by doing the following:
1. Open a new VSCode window
2. Press <kbd>F1</kbd> and type in "open ssh conf" then select "Remote-SSH: Open SSH Configuration File..."
3. Look at the SSH configs listed in the dropdown
    Example: `C:\Users\joshm\.ssh\config`
    For this example I would need to put a private key inside of `C:\Users\joshm\.ssh`

### Windows 10/11 - WSL2:
[Source](https://stackoverflow.com/a/66048792)<br>
**Note:** I've found that this solution randomly stops working and I haven't been able to figure out why.
1. Create a new batch file somewhere on your Windows file system, for example `C:\Users\joshm\ssh.bat`
2. Copy/paste the following into the file and then save the file
    ```
    C:\Windows\system32\wsl.exe ssh %*
    ```
3. Open a new VSCode Window
4. Press <kbd>F1</kbd> and type in "remote ssh settings" then select "Remote-SSH: Settings"
5. Paste the path of your batch file into the "Remote.SSH: Path" field
    Example: `C:\Users\joshm\ssh.bat`
