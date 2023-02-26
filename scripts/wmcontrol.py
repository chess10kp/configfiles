#!/usr/bin/env python
import subprocess

# Run a command and pipe the output to another command
p1 = subprocess.run(["ls", "-l"], stdout=subprocess.PIPE)
p2 = subprocess.Popen(["grep", "wmcontrol"], stdin=p1.stdout, stdout=subprocess.PIPE)
p1.stdout.close()
output, err = p2.communicate()
print(output.decode())

import subprocess

# Define the options for the settings menu
options = [
            "Display Settings",
                "Sound Settings",
                    "Network Settings",
                        "Power Management",
                            "About This System"
                            ]

# Define the Rofi command
rofi_cmd = ["rofi", "-dmenu", "-i", "-p", "Settings:", "-lines", str(len(options))]

# Run the Rofi command and get the selected option
selected_option = subprocess.check_output(rofi_cmd, input="\n".join(options), universal_newlines=True).strip()

# Take action based on the selected option
if selected_option == "Display Settings":
        subprocess.run(["xrandr"])
    elif selected_option == "Sound Settings":
            subprocess.run(["pavucontrol"])
        elif selected_option == "Network Settings":
                subprocess.run(["nm-connection-editor"])
            elif selected_option == "Power Management":
                    subprocess.run(["xfce4-power-manager-settings"])
                elif selected_option == "About This System":
                        subprocess.run(["xfce4-about"])
                    else:
                            print("Invalid option selected.")
                            
