import { AzureFunction, Context, HttpRequest } from "@azure/functions"

import WebPlaywright from '@haibun/web-playwright/build/web-playwright';
import DomainWebpage from '@haibun/domain-webpage/build/domain-webpage';
import { testWithDefaults } from '@haibun/core/build/lib/test/lib';

const inFeatures = [{ path: '/features/test.feature', content: `On the https://www.canada.ca webpage\nshould see "English"\nClick "English"\nURI should start with https://www.canada.ca/en` }];
const httpTrigger: AzureFunction = async function (context: Context, req: HttpRequest) {
    let body;
    if (req.query.run) {
        process.env.HAIBUN_LOG_LEVEL = 'debug';
        const addSteppers = [WebPlaywright, DomainWebpage];
        const { result } = await testWithDefaults(inFeatures, addSteppers)
        body = result;
    } else {
        body = "no directive"
    }
    context.log({ body });
    context.res = { body }
}

export default httpTrigger;
