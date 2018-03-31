<template>
    <nav class="navbar is-primary" role="navigation" aria-label="main navigation">
      <div class="navbar-menu">
        <div class="navbar-start">
          <router-link class="navbar-item" active-class="is-active" exact="true" to="/">Home</router-link>
          <router-link class="navbar-item" active-class="is-active" to="/about">About</router-link>
        </div>
        <div class="navbar-end">
          <div class="navbar-item">
            <div class="field is-horizontal">
              <div class="field-label is-normal">
                <label class="label">Login</label>
              </div>
              <div class="field-body">
                <div class="field">
                  <p class="control has-icons-left">
                    <input class="input" type="text" placeholder="Login">
                    <b-icon
                        class="is-left"
                        type="is-black"
                        icon="login">
                    </b-icon>
                  </p>
                </div>
              </div>
            </div>
          </div>
          <div class="navbar-item">
            <div class="field is-horizontal">
              <div class="field-label is-normal">
                <label class="label">Password</label>
              </div>
              <div class="field-body">
                <div class="field">
                  <p class="control has-icons-left">
                    <input class="input" type="password" placeholder="Password">
                    <b-icon
                        class="is-left"
                        type="is-black"
                        icon="lock">
                    </b-icon>
                  </p>
                </div>
              </div>
            </div>
          </div>
          <div class="navbar-item">
            <div class="field">
              <p class="control">
                <a class="button is-info">Submit</a>
              </p>
            </div>
          </div>
        </div>
      </div>
    </nav>
</template>
