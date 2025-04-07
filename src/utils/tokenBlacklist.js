const blacklistedTokens = new Set();

exports.blacklistToken = (token) => {
    blacklistedTokens.add(token);
};

exports.isBlacklisted = (token) => {
    return blacklistedTokens.has(token);
};
