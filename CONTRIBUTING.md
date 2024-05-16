# Contributing Guidelines
___
Thank you for your interest in contributing to the **"Useful Codes and Scripts"** repository! We appreciate your efforts to make this repository a valuable resource for the community. To ensure a smooth and collaborative experience, please follow these guidelines when contributing.

## How to Contribute?

### Before contributing, make sure you have read the [Code of Conduct](CODE_OF_CONDUCT.md).
- Also browse through code snippets and scripts to ensure that your contribution is not a duplicate.
- If you find a duplicate, you may contribute by improving the existing code snippet or script.
- If you are unsure about whether a code snippet or script is already present, feel free to open an issue to discuss it.
- Submit only proven and tested code snippets or scripts.
- Before pushing your code, please ensure it is parented by the language folder you are pushing to.
- For example, if your code is in Rust, it should be inside a folder within a Rust folder. i.e Rust/my_useful_rust_folder

## How to Contribute

1. Fork the repository to your own GitHub account. 

2. Clone the forked repository to your local machine:
   ```bash
    git clone https://Nerds-catapult/xzz-code-prompts.git
    ```
    
![cloning](/public/cloning%20the%20repository.png)

3. Create a new branch for your contribution:
   ```bash
   git checkout -b "new branch"
   ```
![branching](/public/creating%20a%20new%20branch.png)

To see if you are working in a new branch, run the following command: 
```bash
   git branch
   ```

4. Add your code snippet or script to the appropriate language directory. Make sure to follow the naming conventions and file structure of the repository.

5. Provide a clear and descriptive name for your code snippet or script file.

6. Include a comment at the top of the file explaining the purpose and usage of the code.

7. If your code snippet or script has any dependencies or requires specific instructions to run, please include them in the file or in a separate README file within the same directory.

8. Commit your changes with a descriptive commit message:
```bash
   git add .
   git commit -m "descriptive commit message"
   
   ```
   Please see some [Descriptive Commits](https://theodorusclarence.com/blog/mindful-commit-message) here. 
- feat, for addition or removal of a feature.
- fix, for squashing bugs
- chore, for installing npm packages
- test, for adding test suites
- refactor, for refactoring code flow but not changing the feature itself
- style, for styling code structure like spacing, reorder or remove unused imports, etc.

9. Push your changes to your forked repository:
```bash
   git push
   ```

10. Open a pull request from your forked repository to the main repository. Provide a clear title and description for your pull request, explaining the purpose and benefits of your contribution.

## Code Guidelines

- Make sure your code is well-documented and includes clear comments explaining its functionality.
- Follow the coding conventions and best practices of the respective programming language.
- Test your code thoroughly to ensure it works as expected.
- If your code snippet or script is based on existing code from another source, make sure to provide proper attribution and comply with any applicable licenses.

## Review Process

Once you have submitted a pull request, the repository maintainers will review your contribution. They may provide feedback or request changes to ensure the quality and consistency of the repository. Please be patient and responsive during the review process.

## License

By contributing to this repository, you agree that your contributions will be licensed under the [MIT License](LICENSE).

Thank you for your contributions and happy coding!
