import { greet } from './utils/greet.js';

const name = process.env.APP_NAME ?? 'World';
console.log(greet(name));
