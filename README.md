# node-typescript-template

Starter template for Node.js applications written in TypeScript.

## Tech stack

- **Node.js** >= 22
- **TypeScript** 5.9+
- **ESLint** 9 (flat config, strict type-checked rules)
- **Prettier** 3.5+
- **Jest** with `ts-jest` (ESM support)
- **Docker** (multi-stage build, distroless runtime)

## Getting started

```bash
git clone <repo-url> my-app
cd my-app
npm install
```

## Scripts

```bash
npm run dev           # Start in watch mode (tsx)
npm run build         # Compile TypeScript to dist/
npm start             # Run compiled app
npm test              # Run tests
npm run test:watch    # Run tests in watch mode
npm run lint          # Check for lint errors
npm run lint:fix      # Auto-fix lint errors
npm run format        # Format code with Prettier
npm run format:check  # Check formatting (CI)
npm run clean         # Remove dist/
```

## Project structure

```
src/
├── main.ts           # Entry point
└── utils/
    └── greet.ts      # Example utility
tests/
└── greet.test.ts     # Example test
```

## Docker

```bash
docker build -t my-app .
docker run -p 3000:3000 my-app
```

The Dockerfile uses a multi-stage build with a distroless runtime image and runs as a non-root user.

## Configuration

| File              | Purpose                          |
|-------------------|----------------------------------|
| `tsconfig.json`   | TypeScript compiler options      |
| `eslint.config.js`| ESLint flat config               |
| `.prettierrc`     | Prettier formatting rules        |
| `jest.config.json`  | Jest test runner config          |
| `.nvmrc`          | Node.js version for nvm          |
| `.env.example`    | Environment variable reference   |

## Environment variables

Copy `.env.example` to `.env` and adjust as needed:

```bash
cp .env.example .env
```

| Variable    | Default       | Description         |
|-------------|---------------|---------------------|
| `APP_NAME`  | `World`       | Name used in greeting |
| `NODE_ENV`  | `development` | Runtime environment |
| `PORT`      | `3000`        | Server port         |
