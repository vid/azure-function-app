
const WebPlaywright = require('@haibun/web-playwright/build/web-playwright');
const DomainWebpage = require('@haibun/domain-webpage/build/domain-webpage');

const { testWithDefaults } = require('@haibun/core/build/lib/test/lib');

const inFeatures = [{ path: '/features/test.feature', content: `On the https://www.cbc.ca webpage` }];
module.exports = async function (context, req) {
    if (req.query.run) {
        process.env.HAIBUN_LOG_LEVEL = 'debug';
        const addSteppers = [WebPlaywright.default, DomainWebpage.default];
        const { result } = await testWithDefaults(inFeatures, addSteppers)
        body = result;
    } else {
        body = "no directive"
    }
    context.log({ body });
    context.res = { body }
}