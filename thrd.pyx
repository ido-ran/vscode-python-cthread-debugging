from __future__ import print_function

cdef extern from "unistd.h":
    unsigned int sleep(unsigned int seconds)

cdef extern from "pthread.h":
    void pthread_exit(int n)

    ctypedef int pthread_t

    struct pthread_attr_t:
        pass

    int pthread_create(pthread_t *thread, \
           const pthread_attr_t *attr, \
           void *(*start_routine)(void*), void *arg);

cdef extern from "Python.h":
    ctypedef int PyGILState_STATE
    
    PyGILState_STATE PyGILState_Ensure()

    void PyGILState_Release(PyGILState_STATE state)

    void PyEval_InitThreads()

cdef void *RunThread(void *args):
    cdef PyGILState_STATE gstate;
    gstate = PyGILState_Ensure()

    cdef long threadid = 1
    print("inside the thread " + str(threadid))

    global global_callback
    
    for x in range(0, 3):
        global_callback(x)

        print("thread will sleep for 2 seconds")
        sleep(2)

    # /* Release the thread. No Python API allowed beyond this point. */
    PyGILState_Release(gstate);
    
    pthread_exit(0)

def start_thread(n, callback):
    global global_callback
    global_callback = callback

    print('in pyx ' + str(n))
    # callback(n)
    cdef pthread_t t
    cdef void *args = <void *> 15
    rc = pthread_create(&t, NULL, RunThread, args);
    print('finish start_thread ' + str(rc))
