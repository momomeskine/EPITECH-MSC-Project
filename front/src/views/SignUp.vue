<template>
  <div id="main-container">
    <AnimatedBackground />
    <div class="form-container">
      <h1>Sign Up</h1>
      <h2>Sign up and start managing your time!</h2>
      <form @submit="checkForm">
        <Input title="Email">
          <input type="email" required name="email" placeholder="email" />
        </Input>
        <Input title="Username">
          <input type="text" required name="username" placeholder="username" minlength="3" maxlength="16" />
        </Input>
        <Input title="Password">
          <input type="password" required name="password" placeholder="**********" minlength="6" maxlength="20" />
        </Input>
        <Input title="Validate password" :error="errors.password">
          <input type="password" required name="passwordCheck" placeholder="**********" minlength="6" maxlength="20" />
        </Input>
        <label>
          <router-link :to="{ name: 'SignIn' }" class="label-text-alt">You have an account? <b>Sign in</b>.</router-link>
        </label>
        <Button title="Register" type="submit" :loading="loading" />
      </form>
    </div>
  </div>
</template>

<script>
export default {
  name: 'SignUp',
  components: {
    Input: () => import('@/components/Input'),
    Button: () => import('@/components/Button'),
    AnimatedBackground: () => import('@/components/AnimatedBackground'),
  },
  data() {
    return {
      errors: {},
      loading: false,
    }
  },
  methods: {
    signup() {},
    checkForm(e) {
      e.preventDefault()
      this.errors = {}
      const form = new FormData(e.target)
      if (!form.get('password') || form.get('password') !== form.get('passwordCheck'))
        this.errors.password = 'Password is not identical'
      this.loading = true
      setTimeout(() => {
        this.$router.replace({ name: 'Home' })
      }, 2000)
    },
  },
}
</script>

<style lang="scss" scoped>
#main-container {
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: #fff;
}

.AnimatedBackground {
  position: absolute;
  z-index: -1;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}

.form-container {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;

  h1 {
    @extend %font-lg;
    font-size: 2.5rem;
    margin-bottom: 0.25rem;
  }

  h2 {
    @extend %font-md;
    font-size: 1rem;
    margin-bottom: 1rem;
  }

  form {
    display: flex;
    flex-direction: column;
    width: 18rem;
    font-family: 'DejaVu Sans';

    .Input {
      margin-bottom: 0.5rem;
    }

    > label {
      display: flex;
      align-items: center;
      justify-content: space-between;
      user-select: none;
      padding: 0.25rem 0.25rem;

      .label-text-alt {
        color: hsl(215, 27.9%, 16.9%);

        font-size: 0.75rem;
        line-height: 1rem;
      }
    }

    .Button {
      margin-top: 1.5rem;
    }
  }
}
</style>
