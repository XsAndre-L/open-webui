import { exec } from 'bun';

// Helper function to run shell commands
async function runCommand(command: string, description?: string) {
	if (description) console.log(description);
	const process = exec(command, { stdout: 'inherit', stderr: 'inherit' });
	await process.exited;
	if (process.exitCode !== 0) {
		console.error(`Command failed: ${command}`);
		process.exit(1);
	}
}

async function main() {
	console.log('Starting backend setup...');

	// Navigate to the backend directory
	try {
		process.chdir('backend');
		console.log("Changed directory to 'backend'.");
	} catch (err) {
		console.error('Error: Backend directory not found.');
		process.exit(1);
	}

	// Check if Conda is installed
	try {
		await runCommand('conda --version', 'Checking for Conda installation...');
	} catch {
		console.error('Conda is not installed. Please install Conda and try again.');
		process.exit(1);
	}

	// Create Conda environment
	await runCommand(
		'conda create --yes --name open-webui python=3.11',
		'Creating Conda environment...'
	);

	// Activate Conda environment
	console.log('Activating Conda environment...');
	console.log('Note: Please ensure your shell supports Conda activation.');
	// This may need to be manually done due to shell constraints.

	// Install dependencies
	await runCommand('pip install -r requirements.txt -U', 'Installing dependencies...');

	// Start the backend server
	await runCommand(
		'uvicorn main:app --reload --host 0.0.0.0 --port 8080',
		'Starting the backend server...'
	);
}

main().catch((err) => {
	console.error('Setup script failed.', err);
	process.exit(1);
});
