import { Model } from '@vuex-orm/core'

export default class Course extends Model {
  static get entity () {
    return 'courses'
  }

  static fields () {
    return {
      _id: this.attr({}),
      courseID: this.attr({}),
      classroomID: this.attr({}),
      levels: this.attr([]),
      members: this.attr([])
    }
  }

  static get methodConf () {
    return {
      http: {
        url: '/db/course'
      }
      // methods: {} // customize specific REST calls here
    }
  }
}