# Next.js Implementation

Tailwind v4 + CSS custom properties. Same tokens as Flutter.

## Theme CSS file

Create `styles/ikhlas-theme.css`:

```css
@import "tailwindcss";

@theme {
  --font-ikh: "DM Sans", ui-sans-serif, sans-serif;

  --color-ikh-primary-teal: #007f7c;
  --color-ikh-darker-teal: #006260;
  --color-ikh-secondary-teal: #00b2a9;
  --color-ikh-teal-link-alt: #169d9a;
  --color-ikh-teal-surface: #f0f9f9;
  --color-ikh-teal-pressed-surface: #e1f3f2;
  --color-ikh-dark-gold: #d97f00;
  --color-ikh-gold-link: #956b00;
  --color-ikh-gold-surface: #faf8f2;
  --color-ikh-gold-icon-bg: #f4f0e5;
  --color-ikh-black: #212124;
  --color-ikh-white: #ffffff;
  --color-ikh-grey-800: #424242;
  --color-ikh-grey-700: #616161;
  --color-ikh-grey-600: #75767a;
  --color-ikh-grey-dark: #75767a;
  --color-ikh-grey-90: #4c4c50;
  --color-ikh-grey-light: #d9dbe0;
  --color-ikh-grey-300: #e0e0e0;
  --color-ikh-grey-200: #eaeaea;
  --color-ikh-grey-50: #f9f9f9;
  --color-ikh-grey-notice: #f8f8f8;
  --color-ikh-field-disabled-text: #c5c9d0;
  --color-ikh-red: #dc3224;
  --color-ikh-green: #067e41;
  --color-ikh-badge-red: #fb7268;
  --color-ikh-focus-purple: #4b4fa6;
  --color-ikh-info-blue: #2f73d2;
  --color-ikh-info-blue-text: #2765bd;
  --color-ikh-info-blue-bg: #eaf1fb;
  --color-ikh-notice-info-border: #b4d0f4;
  --color-ikh-notice-error-bg: #feecea;
  --color-ikh-notice-error-border: #fcaaa3;
  --color-ikh-notice-warning-bg: #fff4e5;
  --color-ikh-notice-warning-border: #ffd199;
  --color-ikh-overlay: rgba(0, 0, 0, 0.5);
  --color-ikh-snackbar-bg: #212124;
  --color-ikh-snackbar-action: #67c1bf;
  --color-ikh-toast-bg: #e5e5e5;
  --color-ikh-toast-text: #636363;
  --color-ikh-loyalty-surface: #e9f9fa;
  --color-ikh-whatsapp-green: #4bd763;

  --spacing-ikh-2: 2px;
  --spacing-ikh-4: 4px;
  --spacing-ikh-8: 8px;
  --spacing-ikh-12: 12px;
  --spacing-ikh-16: 16px;
  --spacing-ikh-24: 24px;
  --spacing-ikh-32: 32px;
  --spacing-ikh-40: 40px;
  --spacing-ikh-48: 48px;
  --spacing-ikh-60: 60px;
  --spacing-ikh-64: 64px;
  --spacing-ikh-80: 80px;

  --radius-ikh-sm: 4px;
  --radius-ikh-skeleton-text: 6px;
  --radius-ikh-skeleton-image: 8px;
  --radius-ikh-md: 12px;
  --radius-ikh-pill: 24px;
  --radius-ikh-full: 9999px;
}

:root {
  --ikh-font: var(--font-ikh);
  --ikh-primary-teal: var(--color-ikh-primary-teal);
  --ikh-darker-teal: var(--color-ikh-darker-teal);
  --ikh-secondary-teal: var(--color-ikh-secondary-teal);
  --ikh-teal-surface: var(--color-ikh-teal-surface);
  --ikh-black: var(--color-ikh-black);
  --ikh-grey-700: var(--color-ikh-grey-700);
  --ikh-grey-600: var(--color-ikh-grey-600);
  --ikh-grey-300: var(--color-ikh-grey-300);
  --ikh-grey-200: var(--color-ikh-grey-200);
  --ikh-grey-50: var(--color-ikh-grey-50);
  --ikh-red: var(--color-ikh-red);
  --ikh-space-8: var(--spacing-ikh-8);
  --ikh-space-12: var(--spacing-ikh-12);
  --ikh-space-16: var(--spacing-ikh-16);
  --ikh-space-24: var(--spacing-ikh-24);
  --ikh-space-40: var(--spacing-ikh-40);
  --ikh-space-60: var(--spacing-ikh-60);
  --ikh-radius-sm: var(--radius-ikh-sm);
  --ikh-radius-md: var(--radius-ikh-md);
  --ikh-radius-pill: var(--radius-ikh-pill);
  /* Full --ikh-* color list: references/colors.md */
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
<button
  disabled={!isValid}
  className="h-12 rounded-[var(--ikh-radius-md)] bg-[var(--ikh-primary-teal)] px-[var(--ikh-space-24)] py-[var(--ikh-space-12)] text-base font-medium leading-6 text-white hover:bg-[var(--ikh-darker-teal)] active:bg-[var(--ikh-darker-teal)] disabled:bg-[var(--ikh-grey-300)]"
>
  Daftar Di Sini
</button>
```

### notice (information)
```tsx
<div className="flex gap-[var(--ikh-space-8)] rounded-[var(--ikh-radius-md)] border border-[var(--color-ikh-notice-info-border)] bg-[var(--color-ikh-info-blue-bg)] px-[var(--ikh-space-16)] py-[var(--ikh-space-8)]">
  <InfoIcon className="size-6 shrink-0 text-[var(--color-ikh-info-blue-text)]" />
  <p className="text-xs leading-[18px] text-[var(--color-ikh-info-blue-text)]">Message</p>
</div>
```

Other notice styles (error, warning, general): [components/feedback.md](components/feedback.md).

## Rules

- Prefer CSS variables over hardcoded Tailwind arbitrary values once theme is set up
- Use RSC by default; client components only for interactivity
- Web layout: 1440 frame, 1024px content column, 1248px wide banners, 60px section gap — see [layout.md](layout.md)
- Web buttons need a hover state (Darker Teal) and a visible focus ring
- Follow the IDS component when an older screen differs (see [legacy-migration.md](legacy-migration.md))
- Do not install Tailwind solely for design exports — map to project theme
