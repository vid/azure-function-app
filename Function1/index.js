const { getOptionsOrDefault } = require('@haibun/core/build/lib/util');
const { runWith } = require('@haibun/core/build/lib/run');
const { getDefaultWorld, asFeatures, } = require('@haibun/core/build/lib/test/lib');

module.exports = async function (context, req) {
    let body = 'no directive';
    if (context.query.run) {
        const specl = getOptionsOrDefault();

        const { world } = getDefaultWorld(0);

        const features = asFeatures(inFeatures);
        const backgrounds = asFeatures([]);

        const res = await runWith({ specl, features, backgrounds, addSteppers: [], world, extraOptions: {} });
        body = JSON.stringify(res);
    }
    context.log({ body });
    context.res = { body }
}