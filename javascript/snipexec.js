const vm = require("vm");

const context = vm.createContext({
	console,
	require,
	process,
	setTimeout,
	setInterval
});

let input = "";
process.stdin.on("data", (chunk) => {
	input += chunk;
});

process.stdin.on("end", () => {
	try {
		const result = vm.runInContext(input, context);
	} catch (error) {
		console.error("Error:", error.message);
	}
});

