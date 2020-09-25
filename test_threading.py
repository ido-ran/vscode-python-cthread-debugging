import thrd
import time

def handler(x):
    # place a breakpoint on the print() statement and see that the debugger will not break.
    # uncomment breakpoint() statement and run the program again with debugger, now it will break.
    # breakpoint()
    print('back in Python ' + str(x))

print("in python going to call thrd.start_thread")
thrd.start_thread(321, handler)
print("in python thrd.start_thread done")

print("in python sleep for 4 seconds...")
# text = input("waiting")
time.sleep(4)

print("Python app done.")
