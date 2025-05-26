#!/bin/bash

# Start Ollama in the background.
/bin/ollama serve &
# Record Process ID.
pid=$!

# Pause for Ollama to start.
sleep 5

echo "🔴 Retrieve LLAMA3 model..."
ollama pull llama3.1:8b
echo "🟢 Done!"

echo "🔴 Retrieve LLAMA3 model..."
ollama pull llama3.2:latest
echo "🟢 Done!"

echo "🔴 Creating George Washington..."
ollama create GeorgeWashington --file georgeWashington.modelfile
echo "🟢 Done!"

# Wait for Ollama process to finish.
wait $pid
