"use strict";
/* eslint no-unused-vars: 0 */
import assert from 'assert';
import {{titlecase project_id}} from '../lib/{{project_id}}.js';

describe('{{project_id}}', function() {

  it('should contain commands with actions', function (done) {
    const someObject = new {{titlecase project_id}}();
    assert.ok(someObject instanceof {{titlecase project_id}});
    done();
  });
});