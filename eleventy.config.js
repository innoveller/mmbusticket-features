import eleventyNavigationPlugin from "@11ty/eleventy-navigation";

export default function (eleventyConfig) {
    eleventyConfig.addPlugin(eleventyNavigationPlugin);

	// Add as a valid extension to process
	// Alternatively, add this to the list of formats you pass to the `--formats` CLI argument
	eleventyConfig.addTemplateFormats("feature");

	// "feature" here means that the extension will apply to any .feature file
	eleventyConfig.addExtension("feature", {
        outputFileExtension: "html", // optional, default: "html"
		compile: async (inputContent) => {
			// Replace any instances of cloud with butt
			let output = `
            <pre>
              <code class="language-gherkin"  id="response-div">
                ${inputContent}
              </code>
            </pre>
            `;

			return async () => {
				return output;
			};
		},
	});
};

