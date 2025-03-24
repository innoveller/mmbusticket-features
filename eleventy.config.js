export default function (eleventyConfig) {
    // copy features folder
    eleventyConfig.addPassthroughCopy({ "features": "features"});
};
