serve:
	nix-shell -p pnpm --run "pnpm run start"

install:
	nix-shell -p pnpm --run "pnpm i"
