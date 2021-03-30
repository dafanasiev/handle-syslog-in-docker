#include <syslog.h>
#include <unistd.h>
#include <stdio.h>

int main() {
    openlog ("poc", LOG_CONS | LOG_PID | LOG_NDELAY, LOG_LOCAL1);
    while(1) {
        syslog (LOG_NOTICE, "Program started by User %d", getuid ());
        sleep(1);
    }
    closelog ();
}
