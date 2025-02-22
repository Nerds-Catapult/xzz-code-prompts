On Linux distributions like Manjaro, Archcraft, and Mint ,maybe others too, Firefox on touch screen devices incorrectly interprets touch input as text selection instead of scrolling. This differs from the expected behavior where swiping should scroll the page. Chrome functions correctly.

### Cause

This issue arises from how Firefox handles touch input events on these systems. By default, it might not be utilizing the XInput2 protocol correctly for touch screen interactions  makes Touchscreen not Usable

### Solution to Fix Firefox Touch Input Issue on Linux

1. **Edit `pam_env.conf`:**

    Open the `/etc/security/pam_env.conf` file with administrative privileges using a text editor like `nano`:

    ```bash
    sudo nano /etc/security/pam_env.conf
    ```

2. **Add the `MOZ_USE_XINPUT2` variable:**

    Add the following line at the end of the file:

    ```
    MOZ_USE_XINPUT2 DEFAULT=1
    ```

3. **Save and exit:**

    In `nano`, press:
    - `Ctrl + X` to exit
    - Press `Y` to confirm saving
    - Press `Enter` to confirm the file name

4. **Log out and log back in:**

    Log out of your user session and log back in for the changes to take effect. or just `kill -9 -1`

---

For further reference, see this [Ask Ubuntu thread](https://askubuntu.com/questions/853910/how-to-enable-touchscreen-scrolling-in-firefox/994483#994483).
