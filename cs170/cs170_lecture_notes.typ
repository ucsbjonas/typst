= cs170 lecture notes

use ucsb github\
final is online (or in person optionally)\

== January 9 \

we will use both kthreads an posix threads (posix threads are standard) \

multiple threads have their own stack and program pointers but share the same memory space \

call free() in thread, and not main after pthread_create \

return of thread: return((void \*)result); return value must be a struct \

err = pthread_create(&thread_id, NULL, SumThread, (void \*)args); \

first argument: thread_id address, second argument: scheduling of this thread, third argument: thread name defined elsewhere, fourth argument: pointer to parmeters \


err = pthread_join(thread_id,(void \*\*)&result); means to wait until the thread finishes to coninue execution in main() \

In C, a (void \*) pointer is that can legally point to any data type. \

== January 14

csil has 16 cores \

if we have more threads than cores ?\

any interleaving of instructions that preserves the sequential order of each individual thread is legal and may occur. \

"critical section" of code: cannot preempt(copy) \
"atomic": either all instructions execute or none \
The instructions within a critical section are executed atomically.\

race condition. It occurs when there is a legal ordering of instructions within threads that can make the desired outcome incorrect. \

locks protext critical sections \

it's not good (horrible) to allow pthreads to unlock when the thread that called lock "dies" \

printf is "thread safe" in modern linux system \

phelps 3526 sections tomorrow \

== January 21
semaphores \

synchronization mechanisms: locks, condition variables, forkjoin, semaphores \

reminder: use coniditoned wait in a while loop() (monitors) \

bad: ``` if(s->value < 0) {
                pthread_cond_wait(&(s->wait),&(s->lock));
        } ```

mutex_unlock() before mutex_lock() is undefined \

but v() before p()  is ok, and won't throw an error \

mutual exclusion: must call p (decrement) before v (increment) \

the initial values of the sempaphores: mutex = 1, full = number of total slots, empty = 0, fufilled = 0 \

v() will unlock exactly 1 thread \

kt-threads uses only one core \

== January 23

dining philosophers with semaphores: does not deadlock, but could have starvation issues \

monitors

== January 28

protection domain (buffer overflow concerns with malloc and such)

syscalls execute a ‘trap’ which switches from unprivileged mode to the kernel privileged mode,

open() will return an integer called file descriptor that identifies a file,

read write pointer,

write could expand the file up to max size,

creating a file two times and writing to it will make two files and overwrite the old bytes,

zero out buffer to ensure last character is 0,

open() will move wr pointer to 0


== Feb 4

see the man page

when parent of a child dies the init process collects the zombies \

child inherits pipe cannot open pipe

== Feb 5 section

nothing 

== Feb 6

execve: argv will have a null terminator \

envp loads global variables initialized by the shell (%export VAR = VAR_ASSIGNMENT) (null in lab2)\

env var can be accessed by getenv(VAR) \

export PATH = PATH: "path/dir" \

echo PATH \

when running ls, it is really running some_path/ls \ 

=== Memory Managment

text holds instructions for the program \

MMU: base address (location of start of first process), \

mmu is imported (new) in lab2 and is included in simulator \

internal fragmentation (MFT): small processes that do not require all of the memory in the partition to which they are assigned simply leave that memory idle. \

external fragmentation (MVT): \ 

https://avanthioslab.blogspot.com/2016/09/mvt-and-mft-memory-management-techniques.html \

swapping: store some processes on disk \

== Feb 11

Disk seek time \

track on a sector, platter on a track, 

== Feb 13

inodes point to the locations in memory \

we will study system5 file system \

superblock, ilist, and other datablocks \

ilist consists of inodes \

disk partitioning: two file systems in one disk \

there are also ext2, ext3, etc. filesystems \

sysV: skips 512 data blocks (4k each) and writes the next for every 512 \

each inode represents 1 file \

largest file in the system? (review slide 46 on fs slidesd)

