import path from 'path';
import { all, delay, promisify } from 'bluebird';
import chai, { expect } from 'chai';
import fs from 'chai-fs';
import json from 'chai-json-schema';
import rimraf from 'rimraf';
import boilerplate from '../src/boilerplate';
import process from 'process';
import createMonkey, { ENTER } from './monkey';

chai.use(fs);
chai.use(json);

const rm = promisify(rimraf);

describe.only('boilerplate.js', () => {
    describe('Input and output', () => {
        it('should create a boilerplate', () => {
            return all([boilerplate(), createMonkey().procrastinate(5000)
                .then(monkey => monkey.type('eita mainha...\n\n'))
            ]);
        }).timeout(15000);
    });
});

/*

        it('should answer the questions and create a valid extension', () => {
            const stream = createStream(['boilerplate']);
            const next = text => () => stream.write(`${text}\r`)
                .then(() => stream.once('data'));
            const stop = (text = '') => () => stream.write(`${text}\r`);

            const answerAll = () => stream.once('data')
                .then(next('boilerplate-project'))
                .then(next('0.1.0'))
                .then(next('Boilerplate title'))
                .then(next('Boilerplate description'))
                .then(next('miscellaneous'))
                .then(stop('MIT'))
                .then(() => delay(1000));

            return answerAll()
                .then(() => {
                    const dir = path.join(__dirname, '..', 'boilerplate-project');
                    expect(dir).to.be.a.directory().with.files([
                        'README.md',
                        'package.json',
                        'index.js'
                    ]);
                    expect(path.join(dir, 'package.json')).to.be.a.file()
                        .with.json.using.schema({
                            title: 'package.json schema',
                            type: 'object',
                            required: ['name', 'version', 'category', 'license'],
                            properties: {
                                name: { type: 'string' },
                                version: { type: 'string' }
                            }
                        });
                })
                .tap(() => rm('boilerplate-project'))
                .finally(stream.close);
        }).timeout(20000);
    });
});
*/
