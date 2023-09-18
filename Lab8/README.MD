The overload_server.sh script is designed to simulate an overloaded server by running two primary tasks: a CPU-intensive task and a memory-intensive task.

    CPU-Intensive Task (consume_cpu function):
        This task calculates the value of pi (π) to 5000 decimal places.
        It uses the bc command-line calculator to perform this calculation.
        The calculation is repeated 1,000,000 times in a loop to ensure the CPU is kept busy.
        The task runs in the background (& at the end of the loop).

    Memory-Intensive Task (consume_memory function):
        This task continuously appends sequences of numbers to an array, which causes the array to grow indefinitely.
        As the array grows, it consumes more and more memory.
        The task runs in the background (& at the end of the loop).

    Main Execution:
        The script starts by printing a message, "Simulating an overloaded server..."
        It then calls the consume_cpu function to start the CPU-intensive task.
        Next, it calls the consume_memory function to start the memory-intensive task.
        The wait command at the end ensures that the script remains running as long as the background tasks (functions) are still active.

In essence, when you run this script, it will put a load on both the CPU and memory of the system, simulating the conditions of an overloaded server. This is useful for practicing system diagnostics and process management techniques.
