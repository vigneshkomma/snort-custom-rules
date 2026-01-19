[README.md](https://github.com/user-attachments/files/24559257/README.md)

# Custom Snort Rules

Snort is an open source IDS/IPS system used for monitoring network and to prevent intrusions. 

This project contains custom snort rules for monitoring the corresponding network protocol. 

Protocols included in the project:


1.SSH

2.TCP

3.FTP

4.HTTPS


    NOTE: The rules are written for Snort version 2.9.20



# Snort Installation

In Ubuntu/Debiuan based distributions Snort can be installed with

    sudo apt install snort

For other operating systems and distributions refer to
https://www.snort.org/snort2



## Usage

The config files for Snort are located on /etc/snort in linux based operating systems. The Rules files are located at /etc/snort/rules

To use the rules from this project, copy the files to /etc/snort/rules and edit the snort.conf file at /etc/snort to add the line:

    include $RULE_PATH/file_name.rules

After editing the snort.conf file run snort to start monitoring the traffic:

To log alerts into the console:

    sudo snort -c /etc/snort/snort.conf -i <interface_name> -A console

ToRun Snort in the background(Daemon Mode):

    sudo snort -D -c /etc/snort/snort.conf -i <interface>

The log files for snort will located at /var/log/snort.


## Running Tests

To test the rules, run snort in console mode and use the bash scripts in tests/ from the project.

In the Bash scripts assign the testing machine IP to the $VM_IP variable 

Run the bash scripts from an another system with the IP of the testing machine and monitor the console for alerts. 

Run the bash scripts by:

    ./script_name.sh
## License

The project is under [GNU Public License](https://www.gnu.org/licenses/gpl-3.0.en.html)

