# iostestprooject
iOS test project app

Issues Resolved:
1. Project was not compiling because the target workspace was not set for some of the files like 'DIContainer'
2. The api call was failing because the connection was getting created with 'http' instead of 'https'
3. I have added a comment 'fixed',, whereever I could apply the fix

NOTES:

I have added fixes to the bugs as informed in the task.
I was not able to fix the test cases, but could review the memory issue and reviewed usage of Profiling instrument to identify memory leaks, I would require some more review time to refresh my memory on how can I use these tools to fix memory.
The issue of strong reference being released, which should have released weak reference could be seen. But the strong reference to object is being held in the code.

On a personal note: I've really enjoyed diving back into iOS development. My recent experience has been primarily with web applications (both front and backend) and team management, so it's been a rewarding challenge. I also want to mention that I've had to consult online resources to familiarize myself with some of the more recent iOS concepts and terminology.

Pls check the develop branch for code.
