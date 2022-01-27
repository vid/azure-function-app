import { AzureFunction, Context, HttpRequest } from "@azure/functions"

import runWithOptions from '@haibun/core/build/lib/run-with-options';
import { getOptionsOrDefault } from '@haibun/core/build/lib/util';

export const httpTrigger: AzureFunction = async function (context: Context, req: HttpRequest) {
    let body;
    console.log('env', process.env);

    if (req.query?.run) {
        process.env.HAIBUN_LOG_LEVEL = 'debug';
        const base = 'tests';
        const specl = getOptionsOrDefault(base);
        const protoOptions = { options: {}, extraOptions: {} };
        const featureFilter = ['account-login/'];

        const options = { loops: 2, members: 2, logLevel: 'debug', logFollow: '', splits: [{}], trace: false, specl, base, protoOptions, featureFilter };
        const result = await runWithOptions(options)
        body = ['ok', 'allFailures', 'passed', 'failed', 'totalRan', 'runTime'].reduce((all, i) => ({ ...all, [i]: result[i] }), {});
    } else {
        body = "no directive"
    }
    context.log({ body });
    context.res = { body }
}

