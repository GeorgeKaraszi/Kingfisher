# Kingfisher

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix


# Additional Windows Specific Setup

Due to the nature of some required mix packages. Some packages were only configured to be compiled under the Linux/Mac environment.

We can temporary resolve this issue by doing a semi-hackey fix by compiling it with the GNU make packages for windows.

Packages Currently effected as of **6-11-2017**
* **unicode_util_compat** (0.2.0) - Dependency of UeberAuth
* **certifi** (1.2.1) - Dependency of UeberAuth

## Temp-Solution

* Download and install the [Complete GNU make package](http://gnuwin32.sourceforge.net/packages/make.htm) in the default install directory.

* Set your system environmental variables to point to the **make** application. - _Will require a restart on all command consoles once done_

    * **Warning:** `setx` can be potentially destructive if not assigning PATH correctly.

        `$: setx PATH=%PATH%;C:\Program Files (x86)\GnuWin32\bin`

    * If you don't feel comfortable using `setx`, follow the [java guide](https://www.java.com/en/download/help/path.xml) for accessing a GUI interface.

        Add the `C:\Program Files (x86)\GnuWin32\bin` to your System's Path list

* Modifying dependencies - _Replace the following files_
    1. **deps/certifi/rebar.config**

        ```
        {erl_opts, []}.

        {pre_hooks, [{"(linux|darwin|solaris)", compile, "make -C certs_spec all"},
             {"(freebsd|openbsd)", compile, "gmake -C certs_spec all"},
             {"(win32|win64)", compile, "make -C certs_spec all"}]}.
        ```
    2. **deps/unicode_util_compat/rebar.config.script**

        ```
        _ = code:ensure_loaded(unicode_util),
        case erlang:function_exported(unicode_util, gc, 1) of

        true -> CONFIG;
        false ->
            [{pre_hooks, [{"(linux|darwin|solaris)", compile, "make -C uc_spec all"},
                        {"(freebsd|openbsd)", compile, "gmake -C uc_spec all"},
                        {"(win32|win64)", compile, "make -C uc_spec all"}]} | CONFIG]
        end.

        ```
* Force recompile - `$: mix deps.compile --force`