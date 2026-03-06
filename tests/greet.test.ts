import { greet } from '../src/utils/greet';

describe('greet', () => {
  it('should greet by name', () => {
    expect(greet('Alice')).toBe('Hello, Alice!');
  });

  it('should handle empty string', () => {
    expect(greet('')).toBe('Hello, !');
  });

  it('should handle special characters', () => {
    expect(greet("O'Brien")).toBe("Hello, O'Brien!");
  });
});
