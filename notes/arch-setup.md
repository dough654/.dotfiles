# Arch Setup Notes

## Sleep issues

* Suspend was immediately waking up. Found this article
    * https://www.reddit.com/r/archlinux/comments/y7b97e/my_computer_wakes_up_immediately_after_i_suspend/
* Ran this command:
    * `/bin/sh -c '/bin/echo GPP0 > /proc/acpi/wakeup'`
