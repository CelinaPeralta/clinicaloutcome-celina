<%@ page contentType="text/html"%>
<p>
  You have a New User notification from the Clinical Outcome Registrar
</p>
<br />
----------------------------------------------------------------------
<br />
<p>
  <b>Username:</b> ${command.username}
</p>
<p>
  <b>Email:</b> <a href="mailto:${command.email}">${command.email}</a>
</p>
<br />
----------------------------------------------------------------------
<br />
<p>
  <b>Total number of Registered Users:</b> ${count}
</p>