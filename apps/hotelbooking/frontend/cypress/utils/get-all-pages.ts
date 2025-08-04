import fs from 'fs';
import path from 'path';

const root = './apps/hotelbooking/frontend/src/app';

const searchDepth = (folderPath: string) => {
  let pages: string[] = [];

  const rootFolders = fs.readdirSync(path.join(root, folderPath));
  const folders = rootFolders.filter((folder) => !folder.includes('.'));

  if (rootFolders.includes('page.tsx')) {
    pages.push(`/hotel${folderPath}`);
  }

  folders.forEach((folder) => {
    pages = [...pages, ...searchDepth(path.join(folderPath, folder))];
  });

  return pages;
};

export const getAllPages = () => {
  let pages: string[] = searchDepth('/');

  pages = pages.map((page) =>
    page
      .split('/')
      .filter((pagePath) => !pagePath.includes('(') && !pagePath.includes('nps'))
      .join('/')
  );

  fs.writeFileSync(path.join(...'apps/hotelbooking/frontend'.split('/'), 'cypress', 'utils', 'all-pages.json'), JSON.stringify(pages));

  return;
};

getAllPages();
