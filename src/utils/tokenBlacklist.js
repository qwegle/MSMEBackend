const blacklistedTokens = new Set();

export function blacklistToken(token) {
    blacklistedTokens.add(token);
}

export function isBlacklisted(token) {
    return blacklistedTokens.has(token);
}
