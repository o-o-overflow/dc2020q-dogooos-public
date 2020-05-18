# Dogooos
Dogooos is a dog rating and commenting website.  The post authors add pictures of dogs and give a short write-up on the dog. Other visitors to the site can comment on the dogs.  

![Dogooos](https://github.com/o-o-overflow/dc2020q-dogooos-public/raw/master/dogooos_site.png)

The exploitation of the website required two steps. 
#Stage One
The attacker gains access to an author account by exploiting a comment feature that allowed commenters to refer to the rating used in a particular post. 
```
fmt_cmt = cmt.comment.format(rating=self.__dict__)
```
However, the feature allows access to the __globals__ where demidog's login credentials happened to be stored. Thus, a comment that looks similar to the following would result in the credentials being exposed.
```
{rating[comments][0].__init__.__globals__[post_results]}
```

# Stage Two 
Using demidog's account the attacker was able to create new posts and create new users. In the function `get_user_info()` the function uses f() instead of f"" to use f-string functionality. Unfortunately, this was "legacy" code left from the site's f-string use in Python 2. The library implemented the f-string functionality by using an `eval`. As a result, if the attacker created a user with a name of  `{open('flag').read()}` upon loggin in with the user's account the attacker would be presented with the flag.

# Side note
Although there was a promising route in the script for executing local commands `/runcmd`. It would error because of the seccomp filter which prevented execve.  


