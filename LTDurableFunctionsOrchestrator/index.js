/*
 * This function will be triggered by an HTTP starter function.
 */

const df = require("durable-functions");

module.exports = df.orchestrator(function* (context) {
    const outputs = [];

    for (let i = 0; i < 10; i++) {
    outputs.push(yield context.df.callActivity("LTActivity", i));
    }

    return outputs;
});