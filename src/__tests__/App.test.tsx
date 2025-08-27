import { render, screen } from '@testing-library/react';
import App from '../App';

describe('App Component', () => {
  test('renders welcome message', () => {
    render(<App />);
    const welcomeElement = screen.getByText(/¡Frontend vivo con Vite \+ React 18!/i);
    expect(welcomeElement).toBeInTheDocument();
  });
});
