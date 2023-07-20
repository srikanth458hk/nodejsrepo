// vars/storePullRequestInfo.groovy
def call(String pullRequestId) {
    // Store the pull request information in a shared location.
    // This can be a file, a database, or any other shared resource.

    // Example: Append the pull request ID to a text file.
    writeFile file: 'shared/pull_requests.txt', text: pullRequestId
}
