/** @type {import('tailwindcss').Config} */
module.exports = {
  darkMode: 'class',
  content: ['./*.{html,js}'],
  theme: {
    extend: {
      colors: {
        dominant: {
          DEFAULT: '#111827', // gray-900 (Dark mode dominant)
          light: '#F3F4F6',   // gray-100 (Light mode dominant)
        },
        supporting: {
          DEFAULT: '#1F2937', // gray-800 (Dark mode supporting)
          light: '#FFFFFF',   // white (Light mode supporting)
        },
        accent: {
          DEFAULT: '#A3E635', // lime-400
          hover: '#84CC16',   // lime-500
          dark: '#4D7C0F',    // lime-700 (For light mode text maybe)
        }
      },
      fontFamily: {
        sans: ['Inter', 'sans-serif'],
        mono: ['Fira Code', 'monospace'],
      },
      spacing: {
        '128': '32rem',
      }
    },
  },
  plugins: [],
}
