    <div class="row my-5">
      <div class="col-sm-4 mx-auto my-auto">
      <p>Stop! Who would cross the Bridge of Death must answer me these questions three, ere the other side he see.</p>
      </div>
      <div class="col-sm mx-auto my-auto">
        <table class="table">
          <thead>
            <tr>
              <th scope="col">Bridgekeeper</th>
              <th scope="col">Knight</th>
            </tr>
          </thead>
          <tbody>
          {{ with $i := key "demo/consul-template/questions" | parseJSON }}
            <tr>
              <th scope="row">{{ $i.question1 }}</th>
              <td>{{ $i.answer1 }}</td>
            </tr>
            <tr>
              <th scope="row">{{ $i.question2 }}</th>
              <td>{{ $i.answer2 }}</td>
            </tr>
            <tr>
              <th scope="row">{{ $i.question3 }}</th>
              <td>{{ $i.answer3 }}</td>
            </tr>
          {{ end }}
          </tbody>
        </table>
      </div>
    </div>