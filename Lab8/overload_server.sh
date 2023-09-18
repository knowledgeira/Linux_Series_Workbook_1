 #!/bin/bash

# Create the cpu_task.sh script
cat <<EOL > cpu_task.sh
#!/bin/bash
while true; do
    echo "scale=5000; a(1)*4" | bc -l >/dev/null
done
EOL

# Create the memory_task.sh script
cat <<EOL > memory_task.sh
#!/bin/bash
while true; do
    declare -a arr
    arr+=($(seq 1 100000))
done
EOL

# Create the overload_server.sh script
cat <<EOL > overload_server.sh
#!/bin/bash

# Main script execution
echo "Simulating an overloaded server..."

# Run CPU-intensive task
./cpu_task.sh &

# Run memory-intensive task
./memory_task.sh &

# Keep the script running
wait
EOL

# Set execute permissions for the scripts
chmod +x cpu_task.sh memory_task.sh overload_server.sh

echo "Scripts created and permissions set!"
