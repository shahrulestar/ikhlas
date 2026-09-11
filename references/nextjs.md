# Next.js Implementation

Tailwind v4 + CSS custom properties. Same tokens as Flutter.

## Theme CSS file

Create `styles/ikhlas-theme.css`:

```css
@import "tailwindcss";

@theme {
  --font-ikh: "DM Sans", ui-sans-serif, sans-serif;

  --color-ikh-primary-teal: #007f7c;
  --color-ikh-dark-teal: #00938f;
  --color-ikh-secondary-teal: #00b2a9;
  --color-ikh-teal-link-alt: #169d9a;
  --color-ikh-teal-surface: #f0f9f9;
  --color-ikh-black: #212124;
  --color-ikh-white: #ffffff;
  --color-ikh-grey-800: #424242;
  --color-ikh-grey-700: #616161;
  --color-ikh-grey-600: #75767a;
  --color-ikh-grey-dark: #75767a;
  --color-ikh-grey-90: #4c4c50;
  --color-ikh-grey-light: #d9dbe0;
  --color-ikh-grey-200: #eaeaea;
  --color-ikh-grey-50: #f8f8f8;
  --color-ikh-info-blue: #2f73d2;
  --color-ikh-info-blue-text: #2765bd;
  --color-ikh-info-blue-bg: #eaf1fb;
  --color-ikh-red: #e94335;

  --spacing-ikh-2: 2px;
  --spacing-ikh-4: 4px;
  --spacing-ikh-8: 8px;
  --spacing-ikh-12: 12px;
  --spacing-ikh-16: 16px;
  --spacing-ikh-24: 24px;

  --radius-ikh-sm: 4px;
  --radius-ikh-md: 12px;
}

:root {
  --ikh-font: var(--font-ikh);
  --ikh-primary-teal: var(--color-ikh-primary-teal);
  --ikh-dark-teal: var(--color-ikh-dark-teal);
  --ikh-teal-surface: var(--color-ikh-teal-surface);
  --ikh-space-8: var(--spacing-ikh-8);
  --ikh-space-16: var(--spacing-ikh-16);
  --ikh-radius-md: var(--radius-ikh-md);
}
```

## Font loading (App Router)

```tsx
// app/layout.tsx
import { DM_Sans } from 'next/font/google';
import '@/styles/ikhlas-theme.css';

const dmSans = DM_Sans({ subsets: ['latin'], weight: ['400', '500'], variable: '--font-ikh' });

export default function RootLayout({ children }) {
  return (
    <html lang="en" className={dmSans.variable}>
      <body className="font-[family-name:var(--ikh-font)]">{children}</body>
    </html>
  );
}
```

## Component examples

### action_card
```tsx
<div className="rounded-[var(--ikh-radius-md)] bg-[var(--ikh-teal-surface)] p-[var(--ikh-space-16)]">
  <div className="flex gap-[var(--ikh-space-16)]">
    <div className="size-[46px] shrink-0">{/* icon */}</div>
    <div className="flex flex-col gap-[var(--ikh-space-8)]">
      <p className="text-base font-medium leading-6 text-[var(--ikh-black)]">Title</p>
      <p className="text-sm leading-[21px] text-[var(--ikh-grey-800)]">Subtitle</p>
    </div>
  </div>
</div>
```

### Primary CTA
```tsx
<button className="rounded-[var(--ikh-radius-md)] bg-[var(--ikh-dark-teal)] px-6 py-[11px] text-base font-medium leading-6 text-white">
  Daftar Di Sini
</button>
```

### info banner
```tsx
<div className="rounded-[var(--ikh-radius-sm)] border border-[var(--ikh-info-blue)] bg-[var(--ikh-info-blue-bg)] px-[var(--ikh-space-16)] py-2">
  <div className="flex gap-[var(--ikh-space-8)]">
    <InfoIcon className="size-6 shrink-0 text-[var(--ikh-info-blue-text)]" />
    <p className="text-xs leading-normal text-[var(--ikh-info-blue-text)]">Message</p>
  </div>
</div>
```

## Rules

- Prefer CSS variables over hardcoded Tailwind arbitrary values once theme is set up
- Use RSC by default; client components only for interactivity
- Web content max-width ~1024px with horizontal centering (see desktop frames)
- Do not install Tailwind solely for Figma exports — map to project theme
