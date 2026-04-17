import type { Config } from 'tailwindcss'

const config: Config = {
  content: [
    './src/pages/**/*.{js,ts,jsx,tsx,mdx}',
    './src/components/**/*.{js,ts,jsx,tsx,mdx}',
    './src/app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      colors: {
        brand: {
          50:  '#fff5f5',
          100: '#ffe3e3',
          200: '#ffc9c9',
          300: '#ffa8a8',
          400: '#ff6b6b',
          500: '#e63946',
          600: '#c1121f',
          700: '#9d0208',
          800: '#6a0202',
          900: '#370000',
        },
        gold: {
          400: '#ffd43b',
          500: '#fab005',
          600: '#e67700',
        },
        cream: '#fffaf4',
      },
      boxShadow: {
        card: '0 2px 16px 0 rgba(0,0,0,0.07)',
        hover: '0 8px 32px 0 rgba(0,0,0,0.13)',
      },
    },
  },
  plugins: [],
}
export default config
