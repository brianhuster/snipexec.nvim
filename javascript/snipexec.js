const vm = require("vm");
const readline = require("readline");

const context = vm.createContext({
	console,
	require,
	process,
	setTimeout,
	setInterval
});

const rl = readline.createInterface({
	input: process.stdin,
	output: process.stdout,
	prompt: '> '  // dấu nhắc lệnh
});

rl.prompt();

rl.on('line', (line) => {
	try {
		const result = vm.runInContext(line, context);
		if (result !== undefined) {
			console.log(result);
		}
	} catch (error) {
		console.error("Error:", error.message);
	}
	rl.prompt();
}).on('close', () => {
	console.log('Exiting...');
	process.exit(0);
});
